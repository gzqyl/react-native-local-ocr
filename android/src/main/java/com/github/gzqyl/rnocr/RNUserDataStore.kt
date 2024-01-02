package com.github.gzqyl.rnocr

import android.app.Activity
import android.content.Context
import androidx.datastore.core.DataStore
import androidx.datastore.preferences.core.Preferences
import androidx.datastore.preferences.core.edit
import androidx.datastore.preferences.core.stringPreferencesKey
import androidx.datastore.preferences.preferencesDataStore
import kotlinx.coroutines.flow.firstOrNull
import kotlinx.coroutines.runBlocking

class RNUserDataStore {

    private val Context.dataStore: DataStore<Preferences> by preferencesDataStore(name = "mlkit_langcode_settings")

    val langKey = stringPreferencesKey("mlkit_lang_code")

    fun getMLkitLang(): String {

        return runBlocking{

            Activity().applicationContext.dataStore.data.firstOrNull()?.get(langKey) ?: "en"

        }

    }

    fun setMLkitLang(langCode: String) {

        runBlocking{

            Activity().applicationContext.dataStore.edit { preferences ->
                preferences[langKey] = langCode
            }

        }

    }
    
    fun isLangSetted(): Boolean {

        return runBlocking{

            val langCode = Activity().applicationContext.dataStore.data.firstOrNull()?.get(langKey)

            langCode != null

        }

    }

}